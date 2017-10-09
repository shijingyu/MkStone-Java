package entity;

public class Source {
	private int sId;
	private String sName;
	private String sDescription;
	private String sSize;
	private String sDate;
	private String sType;
	private String sSupport;
	private String sPicture;
	
	@Override
	public String toString() {
		return "Source [sId=" + sId + ", sName=" + sName + ", sDescription=" + sDescription + ", sSize=" + sSize
				+ ", sDate=" + sDate + ", sType=" + sType + ", sSupport=" + sSupport + ", sPicture=" + sPicture + "]";
	}

	public Source(String sName, String sDescription, String sSize, String sDate, String sType, String sSupport,
			String sPicture) {
		super();
		this.sName = sName;
		this.sDescription = sDescription;
		this.sSize = sSize;
		this.sDate = sDate;
		this.sType = sType;
		this.sSupport = sSupport;
		this.sPicture = sPicture;
	}

	public Source() {
		super();
	}

	public Source(int sId, String sName, String sDescription, String sSize, String sDate, String sType, String sSupport,
			String sPicture) {
		super();
		this.sId = sId;
		this.sName = sName;
		this.sDescription = sDescription;
		this.sSize = sSize;
		this.sDate = sDate;
		this.sType = sType;
		this.sSupport = sSupport;
		this.sPicture = sPicture;
	}

	public int getsId() {
		return sId;
	}

	public void setsId(int sId) {
		this.sId = sId;
	}

	public String getsName() {
		return sName;
	}

	public void setsName(String sName) {
		this.sName = sName;
	}

	public String getsDescription() {
		return sDescription;
	}

	public void setsDescription(String sDescription) {
		this.sDescription = sDescription;
	}

	public String getsSize() {
		return sSize;
	}

	public void setsSize(String sSize) {
		this.sSize = sSize;
	}

	public String getsDate() {
		return sDate;
	}

	public void setsDate(String sDate) {
		this.sDate = sDate;
	}

	public String getsType() {
		return sType;
	}

	public void setsType(String sType) {
		this.sType = sType;
	}

	public String getsSupport() {
		return sSupport;
	}

	public void setsSupport(String sSupport) {
		this.sSupport = sSupport;
	}

	public String getsPicture() {
		return sPicture;
	}

	public void setsPicture(String sPicture) {
		this.sPicture = sPicture;
	}

}
