package book;

import java.util.Date;

public class bookDTO {
	private String BCD,TITLE,WRITER,PUBLISH,FNAME,id,name,tradeno,tg;
	private Date rentdate,returndate,buydate;
	private int FCD,PRICE,BCNT,sumprice,sqno;
	public int getSqno() {
		return sqno;
	}
	public void setSqno(int sqno) {
		this.sqno = sqno;
	}
	public int getSumprice() {
		return sumprice;
	}
	public void setSumprice(int sumprice) {
		this.sumprice = sumprice;
	}
	public String getTradeno() {
		return tradeno;
	}
	public void setTradeno(String tradeno) {
		this.tradeno = tradeno;
	}
	public String getTg() {
		return tg;
	}
	public void setTg(String tg) {
		this.tg = tg;
	}
	public Date getBuydate() {
		return buydate;
	}
	public void setBuydate(Date buydate) {
		this.buydate = buydate;
	}
	
	public Date getRentdate() {
		return rentdate;
	}
	public void setRentdate(Date rentdate) {
		this.rentdate = rentdate;
	}
	public Date getReturndate() {
		return returndate;
	}
	public void setReturndate(Date returndate) {
		this.returndate = returndate;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public bookDTO(){
		
	}
	public String getBCD() {
		return BCD;
	}
	public void setBCD(String bCD) {
		BCD = bCD;
	}
	public String getTITLE() {
		return TITLE;
	}
	public void setTITLE(String tITLE) {
		TITLE = tITLE;
	}
	public String getWRITER() {
		return WRITER;
	}
	public void setWRITER(String wRITER) {
		WRITER = wRITER;
	}
	public String getPUBLISH() {
		return PUBLISH;
	}
	public void setPUBLISH(String pUBLISH) {
		PUBLISH = pUBLISH;
	}
	public String getFNAME() {
		return FNAME;
	}
	public void setFNAME(String fNAME) {
		FNAME = fNAME;
	}
	public int getFCD() {
		return FCD;
	}
	public void setFCD(int fCD) {
		FCD = fCD;
	}
	public int getPRICE() {
		return PRICE;
	}
	public void setPRICE(int pRICE) {
		PRICE = pRICE;
	}
	public int getBCNT() {
		return BCNT;
	}
	public void setBCNT(int bCNT) {
		BCNT = bCNT;
	}
	
}
