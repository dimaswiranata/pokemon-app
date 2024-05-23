class Rounded {
  double none, xs, sm, md, reg, lg, xl, xxl, xxxl, full;

  Rounded(
      {this.none = 0.0,
      this.xs = 2.0,
      this.sm = 4.0,
      this.md = 6.0,
      this.reg = 8.0,
      this.lg = 10.0,
      this.xl = 12.0,
      this.xxl = 16.0,
      this.xxxl = 24.0,
      this.full = 9999.0});
}

class Spaces {
  double none, xs, sm, md, reg, lg, xl, xxl, xxxl, infinity;

  Spaces(
      {this.none = 0.0,
      this.xs = 4.0,
      this.sm = 8.0,
      this.md = 12.0,
      this.reg = 16.0,
      this.lg = 20.0,
      this.xl = 24.0,
      this.xxl = 28.0,
      this.xxxl = 32.0,
      this.infinity = double.infinity});
}

class Typography {
  double h1,
      h2,
      h3,
      h4,
      h5,
      h6,
      body,
      bodySm,
      caption,
      captionSm,
      captionXs,
      title,
      subtitle;

  Typography({
    this.h1 = 28.0,
    this.h2 = 24.0,
    this.h3 = 20.0,
    this.h4 = 18.0,
    this.h5 = 16.0,
    this.h6 = 14.0,
    this.body = 16.0,
    this.bodySm = 14.0,
    this.caption = 12.0,
    this.captionSm = 10.0,
    this.captionXs = 8.0,
    this.title = 16.0,
    this.subtitle = 12.0,
  });
}
