let str = React.string

let useState = React.useState
@react.component
let make = () => {
  let (counter, setCounter) = useState(_ => 0)

  let inc = _ => setCounter(_ => counter + 1)
  <div>
    <Mui.Typography variant=#h4 gutterBottom=true>
      {str(`Counter: ${Belt.Int.toString(counter)}`)}
    </Mui.Typography>
    <Mui.Button onClick={inc}> {str("Increment")} </Mui.Button>
  </div>
}
