@Event = React.createClass
    render: ->
      `<tr>
        <td>{this.props.event.title}</td>
        <td>{this.props.event.description}</td>
      </tr>`