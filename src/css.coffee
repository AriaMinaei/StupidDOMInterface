getCSSProp = do ->

	p = null

	el = document.createElement 'div'

	(possibleProps) ->

		for prop in possibleProps

			return prop if el.style[prop] isnt undefined

		return

cssPropertySetter = (prop) ->

	actualProp = getCSSProp getPossiblePropsFor prop

	return (->) unless actualProp?

	(el, v) -> el.style[actualProp] = v

getPossiblePropsFor = (prop) ->

	rest = prop.charAt(0).toUpperCase() + prop.substr(1, prop.length)

	[
		"webkit#{rest}", "moz#{rest}", "o#{rest}", "ms#{rest}", prop
	]

module.exports = css =

	setTransform: cssPropertySetter 'transform'

	setTransformStyle: cssPropertySetter 'transformStyle'

	setTransformOrigin: cssPropertySetter 'transformOrigin'

	setTransformOriginX: cssPropertySetter 'transformOriginX'
	setTransformOriginY: cssPropertySetter 'transformOriginY'
	setTransformOriginZ: cssPropertySetter 'transformOriginZ'

	setCssFilter: cssPropertySetter 'filter'

	setTransitionDuration: cssPropertySetter 'transitionDuration'

	setTransitionTimingFunction: cssPropertySetter 'transitionTimingFunction'

	# Turns numbers to css rgb representation
	rgb: (r, g, b) ->

		'rgb(' + r + ', ' + g + ', ' + b + ')'

	canHaveProp: (prop) ->

		actualProp = getCSSProp getPossiblePropsFor prop

		actualProp?