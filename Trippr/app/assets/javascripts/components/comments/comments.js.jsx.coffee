@Comments = React.createClass
  getInitialState: ->
    comments: @props.comments
  getDefaultProps: ->
    comments: []
  addPost: (post) ->
    comments = @state.comments.slice()
    comments.push post
    @setState comments: comments
  render: ->
    `<div>
      <div className='container'>
        <div className='row'>
          <div className='col-md-12 postList'>
              {this.state.comments.map(function(comment) {
                return <Comment key={comment.id} comment={comment}/>
                })}
          </div>
        </div>
      </div>
    </div>`
