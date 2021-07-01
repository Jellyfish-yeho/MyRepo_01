package MyWebsDto;

public class MyDto {
	private int num;
	private String name;
	private String message;
	private int startRowNum;
	private int endRowNum;
	
	public MyDto() {}

	public MyDto(int num, String name, String message, int startRowNum, int endRowNum) {
		super();
		this.num = num;
		this.name = name;
		this.message = message;
		this.startRowNum = startRowNum;
		this.endRowNum = endRowNum;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public int getStartRowNum() {
		return startRowNum;
	}

	public void setStartRowNum(int startRowNum) {
		this.startRowNum = startRowNum;
	}

	public int getEndRowNum() {
		return endRowNum;
	}

	public void setEndRowNum(int endRowNum) {
		this.endRowNum = endRowNum;
	}

	
}
