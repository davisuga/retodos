let container = ReactDOM.querySelector("#root")
let _ = switch container {
| None => Js.log("No container found")
| Some(container) => {
    let _ = ReactDOM.render(<App />, container)
  }
}
