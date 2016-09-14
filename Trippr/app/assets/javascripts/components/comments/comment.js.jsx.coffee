@Comment = React.createClass
  render: ->
    `<p>
      {this.props.comment.content} <button onClick={this.props.handleDelete}>delete</button>
    </p>`
