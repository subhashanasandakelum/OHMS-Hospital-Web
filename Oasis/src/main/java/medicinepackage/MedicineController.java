package medicinepackage;

import oasisdb.DBConnection;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class MedicineController {

	// Connect DB

	private static boolean isSuccess;
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;

	// Insert Data Function
	public static boolean insertdata(String name, String quantity, String exp, String description) {

		boolean isSuccess = false;
		try {

			// DB CONNECTION CALL
			con = DBConnection.getConnection();
			stmt = con.createStatement();

			// SQL QUERY
			String sql = "insert into medicine values(0,'" + name + "','" + quantity + "','" + exp + "','" + description
					+ "')";
			int rs = stmt.executeUpdate(sql);

			if (rs > 0) {
				isSuccess = true;
			} else {
				isSuccess = false;
			}

		} catch (Exception e) {

			e.printStackTrace();
		}
		return isSuccess;
	}

	public static List<MedicineModel> getById(String Id) {

		int convertedID = Integer.parseInt(Id);

		ArrayList<MedicineModel> medicine = new ArrayList<>();

		try {
			// DB Connection
			con = DBConnection.getConnection();
			stmt = con.createStatement();

			// Query
			String sql = "select * from medicine where id '" + convertedID + "'";

			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				int id = rs.getInt(1);
				String name = rs.getString(2);
				String quantity = rs.getString(3);
				String exp = rs.getString(4);
				String description = rs.getString(5);

				MedicineModel md = new MedicineModel(id, name, quantity, exp, description);

				medicine.add(md);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return medicine;

	}

	// GetAll Data

	public static List<MedicineModel> getAllMedicine() {

		ArrayList<MedicineModel> mediciness = new ArrayList<>();

		try {
			// DB Connection
			con = DBConnection.getConnection();
			stmt = con.createStatement();

			// Query
			String sql = "select * from medicine ";

			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				int id = rs.getInt(1);
				String name = rs.getString(2);
				String quantity = rs.getString(3);
				String exp = rs.getString(4);
				String description = rs.getString(5);

				MedicineModel md = new MedicineModel(id, name, quantity, exp, description);

				mediciness.add(md);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return mediciness;

	}

	// Update Data
	public static boolean updatedata(String id, String name, String quantity, String exp, String description) {
		try {
			// DB Connection
			con = DBConnection.getConnection();
			stmt = con.createStatement();

			// SQL Query
			String sql = "update medicine set name= '" + name + "' , quantity= '" + quantity + "' , exp= '" + exp
					+ "' , description= '" + description + "' " + "where id='" + id + "'";

			int rs = stmt.executeUpdate(sql);

			if (rs > 0) {
				isSuccess = true;
			} else {
				isSuccess = false;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return isSuccess;
	}

	// Delete Data

	public static boolean deletedata(String id) {

		int convID = Integer.parseInt(id);

		try {
			// DB Connection
			con = DBConnection.getConnection();
			stmt = con.createStatement();
			String sql = "delete from medicine where id = '"+convID+"'";
			int rs = stmt.executeUpdate(sql);

			if (rs > 0) {
				isSuccess = true;
			} else {
				isSuccess = false;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return isSuccess;
	}

}
