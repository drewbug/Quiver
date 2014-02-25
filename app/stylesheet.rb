Teacup::Stylesheet.new :stylesheet do
  style :root,
    backgroundColor: UIColor.whiteColor
  style :logo,
    backgroundColor: UIColor.blackColor
  style :label,
    text: '0.0 Hz',
    textAlignment: NSTextAlignmentCenter
  style :slider,
    continuous: false
end
