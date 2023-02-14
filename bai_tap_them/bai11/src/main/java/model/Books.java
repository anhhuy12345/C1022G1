package model;

public class Books {
    private String id;
    private String title;
    private String pageSize;
    private String author;
    private String category;

    public Books() {
    }

    public Books(String id, String title, String pageSize, String author, String category) {
        this.id = id;
        this.title = title;
        this.pageSize = pageSize;
        this.author = author;
        this.category = category;
    }
    public Books(String title, String pageSize, String author, String category){
        this.title = title;
        this.pageSize = pageSize;
        this.author = author;
        this.category = category;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getPageSize() {
        return pageSize;
    }

    public void setPageSize(String pageSize) {
        this.pageSize = pageSize;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }
}
