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


@WebServlet("/salvarTelefones")
public class TelefonesServlets extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    private DaoUsuario daoUsuario = new  DaoUsuario();
    public TelefonesServlets() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		try {
		String user = request.getParameter("user");
		
		BeansCursoJsp usuario = daoUsuario.consultar(user);
		
		request.getSession().setAttribute("userEscolhido", usuario);
		request.setAttribute("userEscolhido", usuario);
		
		
		RequestDispatcher view = request.getRequestDispatcher("/telefones.jsp");
		//request.setAttribute("telefones", daoUsuario.listar());
		request.setAttribute("msg1", "Salvo com sucesso!");
		view.forward(request, response);
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//doGet(request, response);
		
		BeansCursoJsp beansCursoJsp = (BeansCursoJsp) request.getSession().getAttribute("userEscolhido");
		
		 String numero = request.getParameter("numero");
		 String tipo = request.getParameter("tipo");
		
	}

}
