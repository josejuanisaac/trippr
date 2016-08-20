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
                          <a data-toggle="modal" data-target=".bs-modal-sm">Login/Register</a>
                      </li>
                  </ul>
              </div>
          </div>
        </nav>

        <div className="modal fade bs-modal-sm" id="myModal" tabIndex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
          <div className="modal-dialog modal-sm">
            <div className="modal-content">
              <br/>
              <div className="bs-example bs-example-tabs">
                  <ul id="myTab" className="nav nav-tabs">
                    <li className="active"><a href="#signin" data-toggle="tab">Sign In</a></li>
                    <li className=""><a href="#signup" data-toggle="tab">Register</a></li>
                  </ul>
              </div>
              <div className="modal-body">
                <div id="myTabContent" className="tab-content">
                <div className="tab-pane fade active in" id="signin">
                    <form className="form-horizontal">
                    <fieldset>

                    <div className="control-group">
                      <label className="control-label" htmlFor="userid">Alias:</label>
                      <div className="controls">
                        <input required="" id="userid" name="userid" type="text" className="form-control input-medium" placeholder="JoeSixpack" required=""/>
                      </div>
                    </div>


                    <div className="control-group">
                      <label className="control-label" htmlFor="passwordinput">Password:</label>
                      <div className="controls">
                        <input required="" id="passwordinput" name="passwordinput" className="form-control input-medium" type="password" placeholder="********"/>
                      </div>
                    </div>

                    <div className="control-group">
                      <label className="control-label" htmlFor="signin"></label>
                      <div className="controls">
                        <button id="signin" name="signin" className="btn btn-primary">Sign In</button>
                      </div>
                    </div>
                    </fieldset>
                    </form>
                </div>
                <div className="tab-pane fade" id="signup">
                    <form className="form-horizontal">
                    <fieldset>

                    <div className="control-group">
                      <label className="control-label" htmlFor="username">Email:</label>
                      <div className="controls">
                        <input id="Email" name="username" className="form-control input-large" type="text" placeholder="JoeSixpack@sixpacksrus.com" required/>
                      </div>
                    </div>

                    <div className="control-group">
                      <label className="control-label" htmlFor="email">Alias:</label>
                      <div className="controls">
                        <input id="userid" name="email" className="form-control input-large" type="text" placeholder="JoeSixpack" required/>
                      </div>
                    </div>

                    <div className="control-group">
                      <label className="control-label" htmlFor="password">Password:</label>
                      <div className="controls">
                        <input id="password" name="password" className="form-control input-large" type="password" placeholder="********" required/>
                        <em>1-8 Characters</em>
                      </div>
                    </div>

                    <div className="control-group">
                      <label className="control-label" htmlFor="password_confirmation">Confirm password:</label>
                      <div className="controls">
                        <input id="password" name="password_confirmation" className="form-control input-large" type="password" placeholder="********" required/>
                        <em>1-8 Characters</em>
                      </div>
                    </div>

                    <div className="control-group">
                      <label className="control-label" htmlFor="confirmsignup"></label>
                      <div className="controls">
                        <button id="confirmsignup" name="confirmsignup" className="btn btn-primary">Sign Up</button>
                      </div>
                    </div>
                    </fieldset>
                    </form>
              </div>
            </div>
              </div>
              <div className="modal-footer">
              <center>
                <button type="button" className="btn btn-default" data-dismiss="modal">Close</button>
                </center>
              </div>
            </div>
          </div>
        </div>
      </div>`
