package book;

// dto : Data Transfer Object(데이터 전달 객체)
// vo, to 라고도 함
public class BookDTO {
	private int id;
	private String title;
	private String author;
	int price;
	private int qty;

// 기본생성자
	public BookDTO() {
	}

// 매개변수가 있는 생성자
	public BookDTO(String title, String author, int price, int qty) {
		this.title = title;
		this.author = author;
		this.price = price;
		this.qty = qty;
	}

	@Override
	public String toString() {
		return "BookDTO [id=" + id + ", title=" + title + ", author=" + author + ", price=" + price + ", qty=" + qty
				+ "]";
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getQty() {
		return qty;
	}

	public void setQty(int qty) {
		this.qty = qty;
	}
}