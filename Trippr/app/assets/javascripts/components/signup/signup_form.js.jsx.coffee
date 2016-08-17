@SignupForm = React.createClass
    getInitialState: ->
      username: ""
      email: ""
      password: ""
      password_confirmation: ""
    validate: (name, value) ->
      switch (name)
        when 'username' then (if !(value.match(/([a-zA-Z]|\d){8,12}/))
                                "Username has to have length of between 8 - 12 characters or numbers"
                              else
                                null)
        when 'email' then (if !(value.match(/([a-zA-z]|\d)+@([a-zA-z]|\d)+\.([a-zA-z]|\d)+/))
                                "Email format is not correct"
                              else
                                null)
        when 'password' then (if !(value.match(/([a-zA-Z]|\d){8,16}/))
                                "Password has to have length of between 8 - 16 characters or numbers"
                              else
                                null)
        when 'password_confirmation' then (if !(value == @state.password)
                                "It doesn't match the password you typed in"
                              else
                                null)
        else null
    handleChange: (e) ->
      name = e.target.name[5..-2]
      value = e.target.value
      @setState "#{ name }": value
      notice = @validate(name, value)
      if notice
        $('#warning').text('*' + notice)
      else
        $('#warning').empty()
    valid: ->
      @state.username.match(/([a-zA-Z]|\d){8,12}/) && @state.email.match(/([a-zA-z]|\d)+@([a-zA-z]|\d)+\.([a-zA-z]|\d)+/) && @state.password.match(/([a-zA-Z]|\d){8,16}/) && @state.password_confirmation == @state.password
    ###
    handleSubmit: (e) ->
      e.preventDefault()
      $.post '', { event: @state }, (data) =>
        console.log(data)
        @props.handleNewEvent data
        @setState @getInitialState()
      , 'JSON'
    ###
    render: ->
      `<div>
        <h6>* Please fill out all fields</h6>
        <form className='form-inline' method='post' action='/users'>
          <div className='form-group'>
            <input type='text' className='form-control' placeholder='Username' name='user[username]' value={this.state.username} onChange={this.handleChange}></input>
          </div>
          <div className='form-group'>
            <input type='email' className='form-control' placeholder='Email' name='user[email]' value={this.state.email} onChange={this.handleChange}></input>
          </div>
          <div className='form-group'>
            <input type='password' className='form-control' placeholder='Password' name='user[password]' value={this.state.password} onChange={this.handleChange}></input>
          </div>
          <div className='form-group'>
            <input type='password' className='form-control' placeholder='Confirm your password' name='user[password_confirmation]' value={this.state.password_confirmation} onChange={this.handleChange}></input>
          </div>
          <input name='authenticity_token' value={this.props.form_authenticity_token} type="hidden"></input>
          <button className='btn btn-primary' disabled={!this.valid()}>Submit</button>
        </form>
        <h6 id='warning'></h6>
      </div>`