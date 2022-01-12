import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import Person from 'App/Models/Person';
import HashTag from 'App/Models/HashTag';

export default class OthersController {
  
  public async getPeoples(ctx: HttpContextContract) {
    const x = ctx.request.all()
    // console.log(x.query);

    if (x.query) {
      return Person.query().where('title', 'LIKE', '%' + x.query + '%')
    }

    const peoples = await Person.all()
    return peoples
  }
  public async storePeople(ctx: HttpContextContract) {
    let data = ctx.request.all()
    let ob = {
      name: data.name, email: data.email,  title: data.title, image: data.image,
    }
    var regexp = /\B\#\w\w+\b/g
    var result = ob.title.match(regexp);
    if (result) {
      // console.log(result);
      result.forEach(async (element: string) => {
        var quearyParm = element.slice(1)
        ob.title = ob.title.replace(element, "<a href='http://localhost:3000/test?queary="
         + quearyParm + "'>" + element + "</a>");

        const hasTagAvilable = await HashTag.query().where('hastag', element).first();

        if (hasTagAvilable) {
          await HashTag.query().where('hastag', element)
            .update({ count: hasTagAvilable.count + 1 })
        }
        else {
          await HashTag.create({
            hastag: element
          })
        }
      });
    }
    return await Person.create(ob);
  }
  public async deletePeople(ctx: HttpContextContract) {
    let data = ctx.request.all()
    return await Person.query().where('id', data.id).delete();
  }
  public async editPeople(ctx: HttpContextContract) {
    let data = ctx.request.all()
    let ob = {
      name: data.name,
      email: data.email,
      title: data.title,
      image: data.image,
    }
    await Person.query().where("id", data.id).update(ob)
    return await Person.query().where("id", data.id).first()
  }
  public async uploadFile(ctx: HttpContextContract): Promise<any> {
    // console.log(ctx.request.file('file'));

    const profileImage = ctx.request.file('file', {
      size: '10mb',
      extnames: ['jpg', 'png', 'jpeg', 'webp', 'doc', 'pdf'],
    })
    // return ctx.request.all()
    if (profileImage) {
      //  return profileImage
      let type = profileImage.extname


      await profileImage.move('public', {
        // name: `${profileImage.clientName}.${profileImage.extname}`, overwrite: true,
        name: `${profileImage.clientName}`, overwrite: true,
      })
      // const fileName = process.env.CLIENT+`${profileImage.clientName}.${profileImage.extname}`
      const fileName = `${profileImage.clientName}`
      // let upFile = process.env.CLIENT+`/filestore/${fileName}`
      let upFile = "http://localhost:3333/" + `${fileName}`
      return ctx.response.status(200).send({ response: upFile, type: type });

    }
    return ctx.response.status(422).send({ message: 'Invalid request' });

  }
  public async uploadAntDesignFile(ctx: HttpContextContract) {
    // console.log(ctx.request.all());
    // console.log(ctx.request.file('Av'));

    // const profileImage = ctx.request.file('file', {
    //   size: '10mb',
    //   extnames: ['jpg', 'png', 'jpeg', 'webp', 'doc', 'pdf'],
    // })

    const profileImage = ctx.request.file('Av')

    // console.log(profileImage);



    if (profileImage) {
      await profileImage.move('filestore', {
        name: `${profileImage.clientName}`, overwrite: true,
        // name: "Hello", overwrite: true,
      })
    }

  }

}
