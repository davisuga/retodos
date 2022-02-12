let theme = Mui.Theme.create({
  open Mui.ThemeOptions
  make(~palette=PaletteOptions.make(~primary=Primary.make(~main="#E64D4D", ()), ()), ())
})

@react.component
let make = () => {
  open Mui
  <div>
    <Button color=#primary variant=#outlined> {"Default Primary Color"->React.string} </Button>
    {" "->React.string}
    <ThemeProvider theme>
      <Button color=#primary variant=#outlined> {"Themed Primary Color"->React.string} </Button>
    </ThemeProvider>
  </div>
}
