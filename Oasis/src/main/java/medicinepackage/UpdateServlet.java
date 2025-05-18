package medicinepackage;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/UpdateServlet")
public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       


	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String quantity = request.getParameter("quantity");
		String exp = request.getParameter("exp");
		String description = request.getParameter("description");
		
		boolean isTrue;
		isTrue = MedicineController.updatedata(id, name, quantity, exp, description);
		
		
		if(isTrue == true ) {
			List <MedicineModel> medicinedetails = MedicineController.getById(id);
			request.setAttribute("medicinedetails", medicinedetails);
			String alertMessage = "Data Update Successful";
			response.getWriter().println("<script> alert('"+alertMessage+"');window.location.href='GetAllServlet'</script>");
		}
		else {
			
			RequestDispatcher dis2 = request.getRequestDispatcher("wrong.jsp");
			dis2.forward(request, response);
			
		}
		
		doGet(request , response);
		
		
		
		
		
		
	}

}
