@LoginForm = React.createClass
  getInitialState: ->
    email: ""
    password: ""
  validateEmail: (value) ->
    if !(value.match(/([a-zA-z]|\d)+@([a-zA-z]|\d)+\.([a-zA-z]|\d)+/))
      "* e.g example@xxx.com"
    else
      null
  handleChange: (e) ->
    $("#error-message-login").empty()
    name = e.target.name
    value = e.target.value
    error = null
    if name == "email"
      error = @validateEmail(value)
    errorDiv = $("#error-message-email")
    if error
      errorDiv.text error
    else
      errorDiv.empty()
    @setState "#{ name }": value
  valid: ->
    @state.email && @state.password
  handleSubmit: (e) ->
    e.preventDefault()
    $.ajax
      url: "/login"
      type: "POST"
      data: {user: @state}
      dateType: "JSON"
      success: @ajaxSuccess
      error: @ajaxFail
  ajaxSuccess: (data) ->
    console.log 'success'
    console.log data
    @props.handleLogin data
    @setState @getInitialState()
  ajaxFail: (error) ->
    console.log 'fail'
    errorDiv = $("#error-message-login")
    errorDiv.text ->
      "* " + error.responseText
    # errorDiv.css
    #   color: "red"
  render: ->
    `<div className="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul className="nav navbar-nav navbar-right">
        <li className="dropdown">
          <a className="dropdown-toggle" data-toggle="dropdown"><b>Login</b> <span className="caret"></span></a>
          <ul id="login-dp" className="dropdown-menu">
            <li>
               <div className="row">
                  <div className="col-md-12">
                     <form className="form" role="form" method="post" action="login" acceptCharset="UTF-8" id="login-nav" onSubmit={this.handleSubmit}>
                        <div className="form-group">
                           <label className="sr-only" htmlFor="exampleInputEmail2">Email address</label>
                           <input type="test" className="form-control" id="exampleInputEmail2" name="email" placeholder="Email" value={this.state.email} onChange={this.handleChange} required/>
                        </div>
                        <div className="help-block text-left" id="error-message-email"></div>
                        <div className="form-group">
                           <label className="sr-only" htmlFor="exampleInputPassword2">Password</label>
                           <input type="password" className="form-control" id="exampleInputPassword2" placeholder="Password" name="password" value={this.state.password} onChange={this.handleChange} required/>
                                                 <div className="help-block text-right"><a href="">Forget the password ?</a></div>
                        </div>
                        <div className="help-block text-left" id="error-message-login"></div>
                        <div className="form-group">
                          <input name='authenticity_token' value={this.props.form_authenticity_token} type="hidden"/>
                        </div>
                        <div className="form-group">
                           <button type="submit" className="btn btn-primary btn-block" disabled={!this.valid()}>Sign in</button>
                        </div>
                        <div className="checkbox">
                           <label>
                            <input type="checkbox"/> keep me logged-in
                           </label>
                        </div>
                     </form>
                  </div>
                  <div className="bottom text-center">
                    New here ? <a href="/signup"><b>Join Us</b></a>
                  </div>
               </div>
            </li>
          </ul>
        </li>
      </ul>
    </div>`