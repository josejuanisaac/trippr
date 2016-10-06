@Event = React.createClass
  getInitialState: ->
    title: @props.event.title
    description: @props.event.description
    creator_id: @props.event.creator_id
  handleChange: (e) ->
    name = e.target.name
    @setState "#{ name }": e.target.value
  valid: ->
    @state.title && @state.description
  handleEdit: (e) ->
    e.preventDefault()
    $("#event#{this.props.event.id} .eventTitle").html("<input type='text' id='updateTitle' value='#{this.state.title}'></input>")
    $("#event#{this.props.event.id} .eventDescription").html("<input type='text' id='updateDescription' value='#{this.state.description}'></input>")
    $("#event#{this.props.event.id} .saveButton").css("display", "inline")
    $("#updateTitle").focus()

  handleSubmit: (e) ->
    e.preventDefault()
    url = "/events/#{this.props.event.id}"
    title = document.getElementById("updateTitle").value
    description = document.getElementById("updateDescription").value
    data = {
      title: title,
      description: description
    }

    $.ajax
      url: url
      type: 'PUT'
      data: {event: data}
      success: (response) ->
        console.log(response)

  render: ->
    `<tr id={'event'+this.props.event.id}>
      <td className="eventTitle">{this.props.event.title}</td>
      <td className="eventDescription">{this.props.event.description}</td>
      <td><a className='btn btn-primary' href={'/events/'+this.props.event.id}>View</a></td>
      <td id="editButton"><a className='btn btn-primary' onClick={this.handleEdit}>Edit</a><a className='btn btn-primary saveButton' onClick={this.handleSubmit}>Save Changes</a></td>
    </tr>`
