@EditForm = React.createClass
    getInitialState: ->
      title: @props.event.title
      description: @props.event.description
      creator_id: @props.event.creator_id
    handleChange: (e) ->
      name = e.target.name
      @setState "#{ name }": e.target.value
    valid: ->
      @state.title && @state.description
    handleSubmit: (e) ->
      e.preventDefault()
      url = "/events/#{this.props.event.id}"
      $.ajax
        url: url
        type: 'PUT'
        data: {event: @state}
        success: (response) ->
          console.log(response)

    render: ->
      `<form id="eventForm" className='form-inline' onSubmit={this.handleSubmit}>
        <div className='form-group'>
          <input type='text' className='form-control' placeholder='Title' name='title' value={this.state.title} onChange={this.handleChange}></input>
        </div>
        <div className='form-group'>
          <input type='text' className='form-control' placeholder='Description' name='description' value={this.state.description} onChange={this.handleChange}></input>
        </div>
        <div className='form-group'>
          <input type='hidden' className='form-control' name='creator_id' value={this.state.creator_id} onChange={this.handleChange}></input>
        </div>
        <button className='btn btn-primary' disabled={!this.valid()}>Save Changes</button>
      </form>`
