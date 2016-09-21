@Comment = React.createClass
  handleDelete: (e) ->
    e.preventDefault()
    url = "/events/#{@props.event_id}/posts/#{@props.post_id}/comments/#{@props.comment.id}"
    id = this.props.comment.id
    $.ajax
      url: url
      type: 'DELETE'
      success: (response) ->
        $("#comment" + id).remove()
      error: ->
        alert("404 not found")
  renderDeleteButton: ->
    if this.props.creator_id is this.props.comment.user_id
      `<div className="col-md-1 text-left">
        <a className="deleteButton" onClick={this.handleDelete}><span className="glyphicon glyphicon-trash"></span></a>
      </div>`
  renderComment: ->
    `<div className="col-md-11">
      <p>{this.props.comment.content}</p>
    </div>`
  render: ->
    `<div id={"comment" + this.props.comment.id}>
      {this.renderComment()} {this.renderDeleteButton()}
    </div>`
