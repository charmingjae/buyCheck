package buyChain;

import java.util.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
//import java.util.HashMap;



public class Block {
	public int index;
	public String hash;
	public String previousHash;
	private String data; //our data will be a simple message.
//	public String product;
//	public String recipient;
//	public String amount;
	public int[] chain = null;
	private long timeStamp; //as number of milliseconds since 1/1/1970.
	private int nonce;
	public List<Object> BUYLOG;
//	public Map<String, String> mapTrans = new HashMap<>();
	
	
//	Block Constructor.
	public Block(int index, String data, String previousHash, List<Object> transactions, Map<String, String> mapTrans) {
		BUYLOG = new ArrayList<Object>();
		this.index = index + 1;
		this.data = data;
		this.BUYLOG = transactions;
//		this.mapTrans = mapTrans;
		this.previousHash = previousHash;
		this.timeStamp = new Date().getTime();
		this.hash = calculateHash(); //Making sure we do this after we set the other values.
	}
	
	//Calculate new hash based on blocks contents
	public String calculateHash() {
		String calculatedhash = StringUtil.applySha256( 
				previousHash +
				Long.toString(timeStamp) +
				Integer.toString(nonce) + 
				data 
				);
		return calculatedhash;
	}
	
	public void mineBlock(int difficulty) {
		String target = new String(new char[difficulty]).replace('\0', '0'); //Create a string with difficulty * "0" 
		while(!hash.substring( 0, difficulty).equals(target)) {
			nonce ++;
			hash = calculateHash();
		}
		System.out.println("블록 채굴 완료 [ 해쉬 값 ] : " + hash + "\n");
	}
}