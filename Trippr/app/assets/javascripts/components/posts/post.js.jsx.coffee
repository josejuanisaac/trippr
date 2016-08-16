@Post = React.createClass
  render: ->
    '<tr>
      <td>{this.props.post.body}</td>
    </tr>'