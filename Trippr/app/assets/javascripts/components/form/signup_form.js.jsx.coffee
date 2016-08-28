@SignupForm = React.createClass
    getInitialState: ->
      username: ""
      email: ""
      password: ""
      password_confirmation: ""
    validate: (name, value) ->
      switch (name)
        when 'username' then (if !(value.match(/([a-zA-Z]|\d){8,12}/))
                                "8 - 12 characters or numbers"
                              else
                                null)
        when 'email' then (if !(value.match(/([a-zA-z]|\d)+@([a-zA-z]|\d)+\.([a-zA-z]|\d)+/))
                                "Email format is not correct"
                              else
                                null)
        when 'password' then (if !(value.match(/([a-zA-Z]|\d){8,16}/))
                                "8 - 16 characters or numbers"
                              else
                                null)
        when 'password_confirmation' then (if !(value == @state.password)
                                "It doesn't match the password you typed in"
                              else
                                null)
        else null
    handleChange: (e) ->
      name = e.target.name
      value = e.target.value
      @setState "#{ name }": value
      notice = @validate(name, value)
      if notice
        $(e.target.nextSibling).text('* ' + notice)
      else
        $(e.target.nextSibling).empty()
    valid: ->
      @state.username.match(/([a-zA-Z]|\d){8,12}/) && @state.email.match(/([a-zA-z]|\d)+@([a-zA-z]|\d)+\.([a-zA-z]|\d)+/) && @state.password.match(/([a-zA-Z]|\d){8,16}/) && @state.password_confirmation == @state.password
    handleSubmit: (e) ->
      e.preventDefault()
      $.ajax
        url: "/users"
        type: "POST"
        data: {user: @state}
        dateType: "JSON"
        success: @ajaxSuccess
        error: @ajaxFail
    ajaxSuccess: (data) ->
      @props.handleSignup data
      @setState @getInitialState()
    ajaxFail: (error) ->
      errorDiv = $("#error-message-login")
      errorDiv.text ->
        "* " + error.responseText
      errorDiv.css
        color: "red"
    render: ->
      `<div className="tab-pane fade" id="signup" onSubmit={this.handleSubmit}>
        <form className="form-horizontal">
          <fieldset>
            <div className="control-group">
              <label className="control-label" htmlFor="username">Username:</label>
              <div className="controls">
                <input id="username" name="username" className="form-control input-large" type="text" placeholder="JoeSixpack@sixpacksrus.com" value={this.state.username} onChange={this.handleChange} required/>
                <em></em>
              </div>
            </div>

            <div className="control-group">
              <label className="control-label" htmlFor="email">Email:</label>
              <div className="controls">
                <input id="email" name="email" className="form-control input-large" type="text" placeholder="JoeSixpack" value={this.state.email} onChange={this.handleChange} required/>
                <em></em>
              </div>
            </div>

            <div className="control-group">
              <label className="control-label" htmlFor="password">Password:</label>
              <div className="controls">
                <input id="password" name="password" className="form-control input-large" type="password" placeholder="********" value={this.state.password}  onChange={this.handleChange} required/>
                <em></em>
              </div>
            </div>

            <div className="control-group">
              <label className="control-label" htmlFor="password_confirmation">Confirm password:</label>
              <div className="controls">
                <input id="password_confirmation" name="password_confirmation" className="form-control input-large" type="password" placeholder="********" value={this.state.password_confirmation}  onChange={this.handleChange} required/>
                <em></em>
              </div>
            </div>

            <div className="control-group">
              <input name='authenticity_token' value={this.props.form_authenticity_token} type="hidden"></input>
              <em id='error-message-login'></em>
            </div>

            <div className="control-group">
              <label className="control-label" htmlFor="confirmsignup"></label>
              <div className="controls">
                <button id="confirmsignup" name="confirmsignup" className="btn btn-primary" disabled={!this.valid()}>Sign Up</button>
              </div>
            </div>
          </fieldset>
        </form>
      </div>`

