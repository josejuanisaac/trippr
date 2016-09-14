@Comment = React.createClass
  getInitialState: ->
    comment: this.props.comment.content
  handleDelete: (e) ->
    e.preventDefault()
    url = "/events/#{@props.event_id}/posts/#{@props.post_id}/comments/#{@props.comment.id}"
    id = this.props.comment.id
    $.ajax
      url: url
      dataType: 'JSON'
      type: 'DELETE'
      success: (response) ->
        $(".comment" + id).remove()
      error: ->
        alert("404 not found")
  render: ->
    `<p className={"comment" + this.props.comment.id}>
      {this.props.comment.content} <button onClick={this.handleDelete}>delete</button>
    </p>`
