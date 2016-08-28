@FormModal = React.createClass
  handleLogin: (data) ->
    $('#formModal').toggle()
    $('.modal-backdrop').remove()
    @props.loginInSuccessful data
  render: ->
    `<div className="modal fade bs-modal-sm" id="formModal" tabIndex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
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
              <LoginForm form_authenticity_token={this.props.form_authenticity_token} handleLogin={this.handleLogin} />
              <SignupForm form_authenticity_token={this.props.form_authenticity_token} handleSignup={this.handlelogin} />
            </div>
          </div>
          <div className="modal-footer">
          <center>
            <button type="button" className="btn btn-default" data-dismiss="modal">Close</button>
            </center>
          </div>
        </div>
      </div>
    </div>`