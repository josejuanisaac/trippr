@Navbar = React.createClass
    getInitialState: ->
      current_user: @props.current_user
    getDefaultProps: ->
      current_user: null
    loginInSuccessful: (data) ->
      @setState current_user: data
      $("#navbar-signiture").html(`<a className="page-scroll">{"Signed in as " + this.state.current_user.username + " "}<a href= "/logout" className="navbar-link"> Logout</a></a>`)
    renderNavSigniture: ->
      if @state.current_user
        `<a className="page-scroll">{"Hi, " + this.state.current_user.username}<a href= "/logout" className="navbar-link"> Logout</a></a>`
      else
        `<a id="login-logout-tab" data-toggle="modal" data-target=".bs-modal-sm">Login/Register</a>`
    render: ->
      navbarStyle = {
        backgroundColor:'#e3f2fd'
      }
      `<div>
        <nav id="mainNav" className="navbar navbar-default navbar-fixed-top">
          <div className="container-fluid">
              <div className="navbar-header">
                  <button type="button" className="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                      <span className="sr-only">Toggle navigation</span>
                      <span className="icon-bar"></span>
                      <span className="icon-bar"></span>
                      <span className="icon-bar"></span>
                  </button>
                  <a className="navbar-brand page-scroll" href="#page-top">Trippr Logo</a>
              </div>

              <div className="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                  <ul className="nav navbar-nav navbar-right">
                      <li>
                          <a className="page-scroll" href="#about">About</a>
                      </li>
                      <li>
                          <a className="page-scroll" href="#services">Services</a>
                      </li>
                      <li>
                          <a className="page-scroll" href="#portfolio">Examples</a>
                      </li>
                      <li>
                          {this.renderNavSigniture()}
                      </li>
                  </ul>
              </div>
          </div>
        </nav>
        <FormModal loginInSuccessful={this.loginInSuccessful} />
      </div>`
