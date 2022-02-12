open Mui
open Mui.Box

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
  let (title, setTitle) = useState(_ => "")
  let (todos, setTodos) = useState(_ => list{})
  let (text, setText) = useState(_ => "")
  let (error, setError) = useState(_ => "")

  let updateField = (fn, event) => {
    let value = ReactEvent.Form.currentTarget(event)["value"]
    fn(_ => value)
  }

  let addTodo = _ => {
    if String.length(text) < 1 {
      setError(_ => "Please enter a todo")
    } else {
      let todo = {
        id: Belt.List.length(todos),
        text: text,
        title: title,
        completed: false,
      }
      setTodos(_ => list{todo, ...todos})
      setText(_ => "")
      setTitle(_ => "")
    }
  }

  let toggleTodo = targetTodo => {
    let todos = Belt.List.map(todos, todo => {
      if todo.id === targetTodo.id {
        {
          ...targetTodo,
          completed: !targetTodo.completed,
        }
      } else {
        todo
      }
    })
    setTodos(_ => todos)
  }

  let todos =
    todos
    ->Belt.List.toArray
    ->Belt.Array.map(todo => {
      <ListItem key={todo.id->Belt.Int.toString}>
        <ListItemIcon>
          <Checkbox
            edge={Checkbox.Edge.start}
            checked={todo.completed}
            color=#primary
            onClick={_ => toggleTodo(todo)}
            tabIndex={-1->Checkbox.TabIndex.int}
          />
        </ListItemIcon>
        <Box>
          <Typography variant=#h4> {todo.title->str} </Typography>
          <ListItemText> {todo.text->str} </ListItemText>
        </Box>
      </ListItem>
    })
    ->React.array

  <Container>
    <Box display={Value.string("flex")} flexDirection={Value.string("column")}>
      <Box display={Value.string("flex")} flexDirection={Value.string("row")}>
        <Typography color=#primary variant=#h1> {"Re"->str} </Typography>
        <Typography variant=#h1> {"todos"->str} </Typography>
      </Box>
      <TextField
        label={str("Title")}
        value={TextField.Value.string(title)}
        onChange={updateField(setTitle)}
        margin=#normal
      />
      <TextField
        label={str("Text")}
        value={TextField.Value.string(text)}
        onChange={updateField(setText)}
        margin=#normal
      />
      <Button color=#primary onClick={addTodo} variant=#contained> {str("Add todo")} </Button>
    </Box>
    <Box display={Value.string("flex")} flexDirection={Value.string("column")}> {todos} </Box>
    <Snackbar message={str(error)} />
  </Container>
}
