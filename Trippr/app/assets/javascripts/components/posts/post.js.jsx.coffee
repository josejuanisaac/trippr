@Post = React.createClass
  render: ->
    `<div className="post">
      <p>
        {this.props.post.body}
      </p>
      <Comments event_id={this.props.event_id} creator_id={this.props.creator_id} post={this.props.post}/>
    </div>`
