@Post = React.createClass
  render: ->
    `<div>
      <p>
        {this.props.post.body}
      </p>
        <CommentForm/>
    </div>`
