package dto;

public class ReportDTO {
    
    private int report_num;
    private int store_num;
    private int product_num;
    private String reportDetail;
    private String detailText;
    private int member_num;
    public int getReport_num() {
        return report_num;
    }
    public void setReport_num(int report_num) {
        this.report_num = report_num;
    }
    public int getStore_num() {
        return store_num;
    }
    public void setStore_num(int store_num) {
        this.store_num = store_num;
    }
    public int getProduct_num() {
        return product_num;
    }
    public void setProduct_num(int product_num) {
        this.product_num = product_num;
    }
    public String getReportDetail() {
        return reportDetail;
    }
    public void setReportDetail(String reportDetail) {
        this.reportDetail = reportDetail;
    }
    public String getDetailText() {
        return detailText;
    }
    public void setDetailText(String detailText) {
        this.detailText = detailText;
    }
    public int getMember_num() {
        return member_num;
    }
    public void setMember_num(int member_num) {
        this.member_num = member_num;
    }
    
}
