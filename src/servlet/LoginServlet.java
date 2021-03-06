package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import beans.BeansCursoJsp;
import dao.Daologin;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private Daologin daologin = new Daologin();
       
    public LoginServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			BeansCursoJsp beanCursoJSP = new BeansCursoJsp();
			String login = request.getParameter("login");
			String senha = request.getParameter("senha");

			if(login != null && !login.isEmpty() && senha !=null && !senha.isEmpty()) {
			if (daologin.validarLogin(login, senha)) {// Acesso ok
				RequestDispatcher dispatcher = request.getRequestDispatcher("acessoliberado.jsp");
				dispatcher.forward(request, response);
			} else {// Acesso negado
				RequestDispatcher dispatcher = request.getRequestDispatcher("acessonegado.jsp");
				dispatcher.forward(request, response);
				}

			}else {
				RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
				dispatcher.forward(request, response);
				//JOptionPane.showMessageDialog(null, "Digite o login e a senha para prosseguir!");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
