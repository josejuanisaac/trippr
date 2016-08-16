@Posts = React.createClass
  getInitialState: ->
    posts: @props.posts
  getDefaultProps: ->
    posts: []
  render: ->
    '<div className='container'>
      <div className='row'>
        <div className='col-md-12'>
          <h1>Posts</h1>
          {this.state.posts.map(function(post) {
            return <Posts key={post.id} post={post}/>
          })}
        </div>
      </div>
    </div>'
