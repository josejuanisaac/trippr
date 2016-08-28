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
    errorDiv = $(e.target.nextSibling)
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
    @props.handleLogin data
    @setState @getInitialState()
  ajaxFail: (error) ->
    errorDiv = $("#error-message-login")
    errorDiv.text ->
      "* " + error.responseText
    errorDiv.css
      color: "red"
  render: ->
    `<div className="tab-pane fade active in" id="signin" onSubmit={this.handleSubmit}>
      <form className="form-horizontal">
      <fieldset>

      <div className="control-group">
        <label className="control-label" htmlFor="email">Email:</label>
        <div className="controls">
          <input id="email" name="email" type="text" className="form-control input-medium" placeholder="JoeSixpack" value={this.state.email} onChange={this.handleChange} required/>
          <em></em>
        </div>
      </div>


      <div className="control-group">
        <label className="control-label" htmlFor="password">Password:</label>
        <div className="controls">
          <input id="password" name="password" className="form-control input-medium" type="password" value={this.state.password} onChange={this.handleChange} placeholder="********" required/>
        </div>
      </div>

      <div className="control-group">
        <input name='authenticity_token' value={this.props.form_authenticity_token} type="hidden"></input>
        <em id='error-message-login'></em>
      </div>

      <div className="control-group">
        <label className="control-label" htmlFor="signin"></label>
        <div className="controls">
          <button id="signin" name="signin" className="btn btn-primary" disabled={!this.valid()}>Sign In</button>
        </div>
      </div>
      </fieldset>
      </form>
    </div>`