package medicinepackage;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class InsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	
  
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String name = request.getParameter("name");
		String quantity = request.getParameter("quantity");
		String exp = request.getParameter("exp");
		String description = request.getParameter("description");
		
		boolean isTrue;
		
		isTrue = MedicineController.insertdata(name, quantity, exp, description);
		
		if(isTrue == true ) {
			String alertMessage = "Data Insert Successful";
			response.getWriter().println("<script> alert('"+alertMessage+"');window.location.href='GetAllServlet'</script>");
		}
		else {
			
			RequestDispatcher dis2 = request.getRequestDispatcher("wrong.jsp");
			dis2.forward(request, response);
			
		}
		
		
	}

}
