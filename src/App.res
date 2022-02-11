let str = React.string
let useState = React.useState
@react.component
let make = () => {
  let (counter, setCounter) = useState(_ => 0)

  let inc = _ => setCounter(_ => counter + 1)
  <div>
    <h1> {str(`Counter: ${Belt.Int.toString(counter)}`)} </h1>
    <button onClick={inc}> {str("Increment")} </button>
  </div>
}
