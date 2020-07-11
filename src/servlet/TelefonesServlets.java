package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.BeansCursoJsp;
import beans.Telefones;
import dao.DaoTelefones;
import dao.DaoUsuario;


@WebServlet("/salvarTelefones")
public class TelefonesServlets extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    private DaoUsuario daoUsuario = new  DaoUsuario();
    
    private DaoTelefones daoTelefones = new DaoTelefones();
    
    public TelefonesServlets() {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		try {
		
		String acao = request.getParameter("acao");
		if(acao.equalsIgnoreCase("addFone")) {
			
		String user = request.getParameter("user");
		BeansCursoJsp beansCursoJsp = daoUsuario.consultar(user);
		
		request.getSession().setAttribute("userEscolhido", beansCursoJsp);
		request.setAttribute("userEscolhido", beansCursoJsp);
		
		RequestDispatcher view = request.getRequestDispatcher("/telefones.jsp");
		request.setAttribute("telefones", daoTelefones.listar(beansCursoJsp.getId()));
		request.setAttribute("msg1", "Salvo com sucesso!");
		view.forward(request, response);
			} else if (acao.equalsIgnoreCase("deleteFone")) {
				String foneId = request.getParameter("foneId");
				daoTelefones.delete(foneId);
			
			
		BeansCursoJsp beansCursoJsp = (BeansCursoJsp) request.getSession().getAttribute("userEscolhido");
		
		RequestDispatcher view = request.getRequestDispatcher("/telefones.jsp");
		request.setAttribute("telefones", daoTelefones.listar(beansCursoJsp.getId()));
		request.setAttribute("msg1", "Removido com sucesso!");
		view.forward(request, response);
			}
		
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//doGet(request, response);
		
		try {
		BeansCursoJsp beansCursoJsp = (BeansCursoJsp) request.getSession().getAttribute("userEscolhido");
		
		 String numero = request.getParameter("numero");
		 String tipo = request.getParameter("tipo");
		 
		 Telefones telefones = new Telefones();
		 telefones.setNumero(numero);
		 telefones.setTipo(tipo);
		 telefones.setUsuario(beansCursoJsp.getId());
		 
		daoTelefones.salvar(telefones);
		
		request.getSession().setAttribute("userEscolhido", beansCursoJsp);
		request.setAttribute("userEscolhido", beansCursoJsp);
		
		
		
		
		RequestDispatcher view = request.getRequestDispatcher("/telefones.jsp");
		request.setAttribute("telefones", daoTelefones.listar(beansCursoJsp.getId()));
		request.setAttribute("msg1", "Salvo com sucesso!");
		view.forward(request, response);
		
		}catch (Exception e) {
			e.printStackTrace();
		}
	}

}
