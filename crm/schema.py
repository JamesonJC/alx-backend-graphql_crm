import graphene


class Query(graphene.ObjectType):
    hello = graphene.String()

    def resolve_hello(root, info):
        return "Hello, GraphQL!"


# Add a stub Mutation class so it can be imported
class Mutation(graphene.ObjectType):
    pass
