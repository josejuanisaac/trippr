@Navbar = React.createClass
    getInitialState: ->
      current_user: @props.current_user
    getDefaultProps: ->
      current_user: null
    loginInSuccessful: (data) ->
      @setState current_user: data
      $("#navbar-signiture").html(`<p className="navbar-text navbar-right">{"Signed in as " + this.state.current_user.username}<a href= "/logout" className="navbar-link"> Logout</a></p>`)
    renderNavSigniture: ->
      if @state.current_user
        `<p className="navbar-text navbar-right">{"Signed in as " + this.state.current_user.username}<a href= "/logout" className="navbar-link"> Logout</a></p>`
      else
        `<LoginForm handleLogin={this.loginInSuccessful} form_authenticity_token={this.props.form_authenticity_token}/>`
    render: ->
      navbarStyle = {
        backgroundColor:'#e3f2fd'
      }
      `<nav className="navbar navbar-light" style={navbarStyle}>
        <div className="container">
          <a className="navbar-brand" href="/">Trippr</a>
          <div id="navbar-signiture">{ this.renderNavSigniture() }</div>
        </div>
      </nav>`
