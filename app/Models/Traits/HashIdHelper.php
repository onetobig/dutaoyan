<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/11/20
 * Time: 14:11
 */

namespace App\Models\Traits;

use Hashids;

trait HashIdHelper
{
    private $hashId;

    public function getHashIdAttribute()
    {
        if (!$this->hashId) {
            $this->hashId = Hashids::encode($this->id);
        }
        return $this->hashId;
    }

    public function resolveRouteBinding($value)
    {
        if (!is_numeric($value)) {
            $value = current(Hashids::decode($value));
            if (!$value) {
                return;
            }
        }

        return parent::resolveRouteBinding($value);
    }

    public function getRouteKey()
    {
        return $this->hash_id;
    }
}