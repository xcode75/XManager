<?php
namespace App\Http\Controllers\Admin;


use App\Handlers\Config;
use App\Helpers\i18n;
use App\Http\Models\Templates;
use App\Template as View;
use Psr\Http\Message\ResponseInterface;

class TemplatesController
{
	public function getContent($id)
    {
         $template = Templates::where('id','=',$id)->first();
		 return $template->content;
    }
	
	public function templates($request, $response, $args)
    {
		$lang = new i18n();
        $table_config['total_column'] = array(
			'op' 		=> $lang->get('Action'),
            'id' 		=> '#ID', 
            'title' 	=> $lang->get('Title'),
            'datetime' 	=> $lang->get('UpdDate'),
        );
        $table_config['default_show_column'] = array(
            'op','id','title','datetime'
        );
        $table_config['ajax_url'] = 'templates/ajax';
		$response->getBody()->write(View::getSmarty()->assign('table_config', $table_config)
		->fetch('admin/templates/index.tpl')); 
		return  $response;
    }
	
	public function edit($request, $response, $args)
    {
		$id = $args['id'];
        $templates = Templates::find($id);
        $response->getBody()->write(View::getSmarty()->assign('templates', $templates)
		->fetch('admin/templates/edit.tpl'));
		return  $response;
	}

	public function update($request, $response, $args)
    {
		$lang = new i18n();
		$Config = new Config();
		$content = $request->getParsedBody();
        $id = $args['id'];
		
        $templates = Templates::find($id);
        $templates->content 	= $content['content'];
        $templates->title 		= $content['title'];
        $templates->datetime 	= time();

        if (!$templates->save()) {
            $rs['ret'] = 0;
            $rs['msg'] = $lang->get('UpdateFail');
            $response->getBody()->write(json_encode($rs));
			return $response;
        }
		$rs['ret'] = 1;
		$rs['msg'] = $lang->get('UpdateSucess');
		$response->getBody()->write(json_encode($rs));
		return $response;
	}	
	

    public function ajax($request, $response, $args): ResponseInterface
    {
	    $lang = new i18n();
		$content = $request->getParsedBody();
		$Config = new Config();
        $query = Templates::getTableDataFromAdmin(
            $request,
            static function (&$order_field) {
                if (in_array($order_field, ['op'])) {
                    $order_field = 'id';
                }
            }
        );

        $data  = [];
        foreach ($query['datas'] as $value) {
            $tempdata               = [];
            $tempdata['op']         = '
				<a  href="/admin/templates/' . $value->id . '/edit" class="btn btn-sm btn-relief-primary" style="background-color:'.($Config->getConfig('app_color')).';color:#ffffff;fot-size:35px"><i class="far fa-edit" > '. $lang->get('edit').'</i></a>	
				';	
			$tempdata['id']         = $value->id;
			$tempdata['title']      = $value->title;
            $tempdata['datetime']   = date('Y-m-d H:i:s', $value->datetime);
            $data[] = $tempdata;
        }

		$res['draw'] = $content['draw'];
		$res['recordsTotal'] = Templates::count();
		$res['recordsFiltered'] = $query['count'];
		$res['data'] = $data;
		
		$response->getBody()->write(json_encode($res));
		return $response;		
    }	
}