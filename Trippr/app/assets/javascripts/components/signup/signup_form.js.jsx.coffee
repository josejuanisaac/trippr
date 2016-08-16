@SignupForm = React.createClass
    getInitialState: ->
      username: ""
      email: ""
      password: ""
      password_confirmation: ""
    handleChange: (e) ->
      name = e.target.name
      @setState "#{ name[5..-2] }": e.target.value
    valid: ->
      @state.username && @state.email && @state.password && @state.password_confirmation
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
      `<form className='form-inline' method='post' action='/users'>
        <div className='form-group'>
          <input type='text' className='form-control' placeholder='Username' name='user[username]' value={this.state.username} onChange={this.handleChange}></input>
        </div>
        <div className='form-group'>
          <input type='text' className='form-control' placeholder='Email' name='user[email]' value={this.state.email} onChange={this.handleChange}></input>
        </div>
        <div className='form-group'>
          <input type='text' className='form-control' placeholder='Password' name='user[password]' value={this.state.password} onChange={this.handleChange}></input>
        </div>
        <div className='form-group'>
          <input type='text' className='form-control' placeholder='Confirm your password' name='user[password_confirmation]' value={this.state.password_confirmation} onChange={this.handleChange}></input>
        </div>
        <input name='authenticity_token' value={this.props.form_authenticity_token} type="hidden"></input>
        <button className='btn btn-primary' disabled={!this.valid()}>Submit</button>
      </form>`