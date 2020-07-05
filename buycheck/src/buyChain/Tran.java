package buyChain;

import java.util.List;

public class Tran {
	public static String product;
	public static String nation;
	public static String amount;
	public static List<Tran> trans;
	
	
	public String getproduct() {
		return product;
	}

	public void setproduct(String product) {
		Tran.product = product;
	}

	public String getnation() {
		return nation;
	}

	public void setnation(String nation) {
		Tran.nation = nation;
	}

	public String getAmount() {
		return amount;
	}

	public void setAmount(String amount) {
		Tran.amount = amount;
	}

	public List<Tran> getTrans() {
		return trans;
	}

	public void setTrans(List<Tran> trans) {
		Tran.trans = trans;
	}
}
