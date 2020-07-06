package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.BeansCursoJsp;
import dao.DaoUsuario;

@WebServlet("/salvarUsuario")
public class Usuario extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   private DaoUsuario daoUsuario = new DaoUsuario() ;
	
    public Usuario() {
        super();
       
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		try {
		String acao =request.getParameter("acao");
		String user =request.getParameter("user");
		
		if(acao.equalsIgnoreCase("delete")) {
			daoUsuario.delete(user);
			RequestDispatcher view = request.getRequestDispatcher("/cadastroUsuario.jsp");
			request.setAttribute("usuarios", daoUsuario.listar());
			view.forward(request, response);
			}else if(acao.equalsIgnoreCase("editar")) {
				
				BeansCursoJsp beansCursoJsp = daoUsuario.consultar(user);
				
				RequestDispatcher view = request.getRequestDispatcher("/cadastroUsuario.jsp");
				request.setAttribute("user", beansCursoJsp);
				view.forward(request, response);
			}else if(acao.equalsIgnoreCase("listartodos")) {
				RequestDispatcher view = request.getRequestDispatcher("/cadastroUsuario.jsp");
				request.setAttribute("usuarios", daoUsuario.listar());
				view.forward(request, response);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//doGet(request, response);
		
		String acao= request.getParameter("acao");
		
		if(acao!=null && acao.equalsIgnoreCase("reset")) {
			try {
				RequestDispatcher view = request.getRequestDispatcher("/cadastroUsuario.jsp");
				request.setAttribute("usuarios", daoUsuario.listar());
				view.forward(request, response);

			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}else {
		
		String id = request.getParameter("id");
		String login = request.getParameter("login");
		String senha = request.getParameter("senha");
		String nome = request.getParameter("nome");
		String telefone = request.getParameter("telefone");
		
		String cep = request.getParameter("cep");
		String rua = request.getParameter("rua");
		String bairro = request.getParameter("bairro");
		String cidade = request.getParameter("cidade");
		String estado = request.getParameter("estado");
		String ibge = request.getParameter("ibge");
		
		BeansCursoJsp usuario = new BeansCursoJsp();
		
		usuario.setId(!id.isEmpty()? Long.parseLong(id):null);
		usuario.setLogin(login);
		usuario.setSenha(senha);
		usuario.setNome(nome);
		usuario.setTelefone(telefone);
		
		usuario.setCep(cep);
		usuario.setRua(rua);
		usuario.setBairro(bairro);
		usuario.setCidade(cidade);
		usuario.setEstado(estado);
		usuario.setIbge(ibge);
		
		try {
			String msg = null;
			boolean podeInserir = true;
			
			if(login == null || login.isEmpty()) {
				msg = "Login deve ser informado";
				podeInserir=false;
			}
			else if(senha == null || senha.isEmpty()) {
				msg = "Senha deve ser informada";
				podeInserir=false;
			}
			else if(nome == null || nome.isEmpty()) {
				msg = "Nome deve ser informado";
				podeInserir=false;
			}
			else if(telefone == null || telefone.isEmpty()) {
				msg = "Telefone deve ser informado";
				podeInserir=false;
			}
			
			else if(id==null || id.isEmpty() && !daoUsuario.validarLogin(login)) {
			request.setAttribute("msg", "Usuário já existe com o mesmo login!");
			podeInserir = false;
		}
		else if(id==null || id.isEmpty() && !daoUsuario.validarSenha(senha)) {
			request.setAttribute("msg", "Usuário já existe com a mesma senha!");
			podeInserir = false;
		}
			
		if(msg != null) {
			request.setAttribute("msg", msg);
		}
		else if(id==null || id.isEmpty() && daoUsuario.validarLogin(login) && daoUsuario.validarSenha(senha)) {
			daoUsuario.salvar(usuario);
			
		}else if(id!=null && !id.isEmpty() && daoUsuario.validarLoginUpdate(login, id)) {
			if(!daoUsuario.validarLoginUpdate(login, id)) {
				request.setAttribute("msg", "Usuário já existe com o mesmo login!");
			}
			else if (id !=null && !id.isEmpty() && podeInserir){
			daoUsuario.atualizar(usuario);
			}
		}
		
		if(!podeInserir) {
			request.setAttribute("user", usuario);
		}
		
		//Para ficar na mesma pagina apos cadastrar usuario
		
			RequestDispatcher view = request.getRequestDispatcher("/cadastroUsuario.jsp");
			request.setAttribute("usuarios", daoUsuario.listar());
			view.forward(request, response);

		} catch (Exception e) {
			e.printStackTrace();
			}
		}
	}

}
