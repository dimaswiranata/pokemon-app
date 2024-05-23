class PageInfo {
  int? count, currentPage, pageSize, totalPage;

  PageInfo(
      {this.count = 5,
      this.currentPage = 1,
      this.pageSize = 5,
      this.totalPage = 1});
}
