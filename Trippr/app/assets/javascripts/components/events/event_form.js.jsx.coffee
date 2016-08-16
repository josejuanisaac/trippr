@EventForm = React.createClass
    getInitialState: ->
      title: ""
      description: ""
      creator_id: @props.creator_id
    handleChange: (e) ->
      name = e.target.name
      @setState "#{ name }": e.target.value
    valid: ->
      @state.title && @state.description
    handleSubmit: (e) ->
      e.preventDefault()
      $.post '', { event: @state }, (data) =>
        console.log(data)
        @props.handleNewEvent data
        @setState @getInitialState()
      , 'JSON'
    render: ->
      `<form className='form-inline' onSubmit={this.handleSubmit}>
        <div className='form-group'>
          <input type='text' className='form-control' placeholder='Title' name='title' value={this.state.title} onChange={this.handleChange}></input>
        </div>
        <div className='form-group'>
          <input type='text' className='form-control' placeholder='Description' name='description' value={this.state.description} onChange={this.handleChange}></input>
        </div>
        <div className='form-group'>
          <input type='hidden' className='form-control' name='creator_id' value={this.state.creator_id} onChange={this.handleChange}></input>
        </div>
        <button className='btn btn-primary' disabled={!this.valid()}>Create event</button>
      </form>`