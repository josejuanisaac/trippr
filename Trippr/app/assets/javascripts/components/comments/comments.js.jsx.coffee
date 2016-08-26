@Comments = React.createClass
  getInitialState: ->
    comments: @props.comments
  getDefaultProps: ->
    comments: []
  addComment: (comment) ->
    comments = @state.comments.slice()
    comments.push comment
    @setState comments: comments
  render: ->
    `<div>
      <div className='container'>
        <div className='row'>
          <div className='col-md-12 commentList'>
              {this.state.comments.map(function(comment) {
                return <Comment key={comment.id} comment={comment}/>
              })}
          </div>
        </div>
      </div>
    </div>`
