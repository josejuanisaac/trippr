@Event = React.createClass
    render: ->
      `<tr>
        <td>{this.props.event.title}</td>
        <td>{this.props.event.description}</td>
        <td><a className='btn btn-primary' href={'/events/'+this.props.event.id}>View</a></td>
      </tr>`