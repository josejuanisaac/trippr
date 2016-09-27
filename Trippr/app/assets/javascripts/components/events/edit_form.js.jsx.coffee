@EditForm = React.createClass
    getInitialState: ->
      title: @props.event.title
      description: @props.event.description
      creator_id: @props.event.creator_id
      id: @props.event.id
    handleChange: (e) ->
      name = e.target.name
      @setState "#{ name }": e.target.value
    valid: ->
      @state.title && @state.description
    handleSubmit: (e) ->
      # e.preventDefault()
      url = "/events/#{this.props.event.id}"
      data = $("#eventForm").serialize()
      console.log(data)

      $.ajax
        url: url
        type: 'PUT'
        data: data
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
