open Mui
let str = React.string
let int = React.int

type todo = {
  id: int,
  text: string,
  title: string,
  completed: bool,
}

let useState = React.useState
@react.component
let make = () => {
  <ThemeProvider theme={CustomTheme.theme}> <Home.make /> </ThemeProvider>
}
