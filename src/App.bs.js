// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Curry from "rescript/lib/es6/curry.js";
import * as React from "react";
import * as Belt_List from "rescript/lib/es6/belt_List.js";
import * as Belt_Array from "rescript/lib/es6/belt_Array.js";
import * as Checkbox$Mui from "rescript-material-ui/src/Checkbox.bs.js";
import * as Core from "@material-ui/core";

function str(prim) {
  return prim;
}

function $$int(prim) {
  return prim;
}

function useState(prim) {
  return React.useState(function () {
              return Curry._1(prim, undefined);
            });
}

function App(Props) {
  var match = React.useState(function () {
        return "";
      });
  var setTitle = match[1];
  var title = match[0];
  var match$1 = React.useState(function () {
        return /* [] */0;
      });
  var setTodos = match$1[1];
  var todos = match$1[0];
  var match$2 = React.useState(function () {
        return "";
      });
  var setText = match$2[1];
  var text = match$2[0];
  var match$3 = React.useState(function () {
        return "";
      });
  var setError = match$3[1];
  var updateField = function (fn, $$event) {
    var value = $$event.currentTarget.value;
    return Curry._1(fn, (function (param) {
                  return value;
                }));
  };
  var addTodo = function (param) {
    if (text.length < 1) {
      return Curry._1(setError, (function (param) {
                    return "Please enter a todo";
                  }));
    }
    var todo_id = Belt_List.length(todos);
    var todo = {
      id: todo_id,
      text: text,
      title: title,
      completed: false
    };
    Curry._1(setTodos, (function (param) {
            return {
                    hd: todo,
                    tl: todos
                  };
          }));
    Curry._1(setText, (function (param) {
            return "";
          }));
    return Curry._1(setTitle, (function (param) {
                  return "";
                }));
  };
  var items = Belt_Array.map(Belt_List.toArray(todos), (function (todo) {
          return React.createElement(Core.ListItem, {
                      children: null,
                      key: String(todo.id)
                    }, React.createElement(Core.ListItemIcon, {
                          children: React.createElement(Core.Checkbox, {
                                onClick: (function (param) {
                                    var todos$1 = Belt_List.map(todos, (function (todo$1) {
                                            if (todo$1.id === todo.id) {
                                              return {
                                                      id: todo.id,
                                                      text: todo.text,
                                                      title: todo.title,
                                                      completed: !todo.completed
                                                    };
                                            } else {
                                              return todo$1;
                                            }
                                          }));
                                    return Curry._1(setTodos, (function (param) {
                                                  return todos$1;
                                                }));
                                  }),
                                tabIndex: -1,
                                edge: Checkbox$Mui.Edge.start,
                                checked: todo.completed
                              })
                        }), React.createElement(Core.Box, {
                          children: null
                        }, React.createElement(Core.Typography, {
                              children: todo.title,
                              variant: "h4"
                            }), React.createElement(Core.ListItemText, {
                              children: todo.text
                            })));
        }));
  return React.createElement(Core.Container, {
              children: null
            }, React.createElement(Core.Box, {
                  children: null,
                  display: "flex",
                  flexDirection: "column"
                }, React.createElement(Core.TextField, {
                      label: "Title",
                      onChange: (function (param) {
                          return updateField(setTitle, param);
                        }),
                      value: title
                    }), React.createElement(Core.TextField, {
                      label: "Text",
                      onChange: (function (param) {
                          return updateField(setText, param);
                        }),
                      value: text
                    }), React.createElement(Core.Button, {
                      onClick: addTodo,
                      children: "Add todo",
                      color: "primary",
                      variant: "contained"
                    })), React.createElement(Core.Box, {
                  children: items,
                  display: "flex",
                  flexDirection: "column"
                }), React.createElement(Core.Snackbar, {
                  message: match$3[0]
                }));
}

var make = App;

export {
  str ,
  $$int ,
  useState ,
  make ,
  
}
/* react Not a pure module */
