@Event = React.createClass
  # getInitialState: ->
  #   edit: false
  # handleToggle: (e) ->
  #   e.preventDefault()
  #   @setState edit: !@state.edit

  render: ->
    `<tr>
      <td>{this.props.event.title}</td>
      <td>{this.props.event.description}</td>
      <td><a className='btn btn-primary' href={'/events/'+this.props.event.id}>View</a></td>
      <td><a className='btn btn-primary' href={'/events/'+this.props.event.id+'/edit'}>Edit</a></td>
    </tr>`
