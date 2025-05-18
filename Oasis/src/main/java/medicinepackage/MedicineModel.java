package medicinepackage;

public class MedicineModel {

	private int id;
	private String name;
	private String quantity;
	private String exp;
	private String description;
	
	
	public MedicineModel(int id, String name, String quantity, String exp, String description) {
		super();
		this.id = id;
		this.name = name;
		this.quantity = quantity;
		this.exp = exp;
		this.description = description;
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getQuantity() {
		return quantity;
	}


	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}


	public String getExp() {
		return exp;
	}


	public void setExp(String exp) {
		this.exp = exp;
	}


	public String getDescription() {
		return description;
	}


	public void setDescription(String description) {
		this.description = description;
	}

	
	 
	
	
	
}
