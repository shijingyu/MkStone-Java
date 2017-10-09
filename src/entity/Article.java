package entity;

public class Article {
	public Article(String aName, String aContent, String aPicture, String aAuthor, String aDate, String aType) {
		super();
		this.aName = aName;
		this.aContent = aContent;
		this.aPicture = aPicture;
		this.aAuthor = aAuthor;
		this.aDate = aDate;
		this.aType = aType;
	}

	@Override
	public String toString() {
		return "Article [aId=" + aId + ", aName=" + aName + ", aContent=" + aContent + ", aPicture=" + aPicture
				+ ", aAuthor=" + aAuthor + ", aType=" + aType + ", aDate=" + aDate + "]";
	}

	public Article(int aId, String aName, String aContent, String aPicture, String aAuthor, String aDate,
			String aType) {
		super();
		this.aId = aId;
		this.aName = aName;
		this.aContent = aContent;
		this.aPicture = aPicture;
		this.aAuthor = aAuthor;
		this.aDate = aDate;
		this.aType = aType;
	}
	
	

	public Article(int aId, String aName, String aContent, String aPicture, String aAuthor, String aType, String aDate,
			int aCollection) {
		super();
		this.aId = aId;
		this.aName = aName;
		this.aContent = aContent;
		this.aPicture = aPicture;
		this.aAuthor = aAuthor;
		this.aType = aType;
		this.aDate = aDate;
		this.aCollection = aCollection;
	}

	public Article(String aName, String aContent, String aPicture, String aAuthor, String aType) {
		super();
		this.aName = aName;
		this.aContent = aContent;
		this.aPicture = aPicture;
		this.aAuthor = aAuthor;
		this.aType = aType;
	}

	private int aId; // ����ID
	private String aName; // ���±���
	private String aContent; // ��������
	private String aPicture; // ����ͼƬ
	private String aAuthor; // ��������
	private String aType; // ��������
	private String aDate; // ���·���ʱ��
	private int aCollection;

	public Article() {
		super();
	}

	public int getaId() {
		return aId;
	}

	public void setaId(int aId) {
		this.aId = aId;
	}

	public String getaName() {
		return aName;
	}

	public void setaName(String aName) {
		this.aName = aName;
	}

	public String getaContent() {
		return aContent;
	}

	public void setaContent(String aContent) {
		this.aContent = aContent;
	}

	public String getaPicture() {
		return aPicture;
	}

	public void setaPicture(String aPicture) {
		this.aPicture = aPicture;
	}

	public String getaAuthor() {
		return aAuthor;
	}

	public void setaAuthor(String aAuthor) {
		this.aAuthor = aAuthor;
	}

	public String getaDate() {
		return aDate;
	}

	public void setaDate(String aDate) {
		this.aDate = aDate;
	}

	public String getaType() {
		return aType;
	}

	public void setaType(String aType) {
		this.aType = aType;
	}

	public int getaCollection() {
		return aCollection;
	}

	public void setaCollection(int aCollection) {
		this.aCollection = aCollection;
	}
}
